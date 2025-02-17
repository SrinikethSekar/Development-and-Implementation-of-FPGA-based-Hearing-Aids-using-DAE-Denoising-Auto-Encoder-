import numpy as np
import tensorflow as tf

# Generate Noisy Sine Wave Dataset
samples = 1024
x = np.linspace(0, 2 * np.pi, samples)
clean_signal = np.sin(x)
noise = np.random.normal(0, 0.2, samples)
noisy_signal = clean_signal + noise

# Prepare Dataset for Training
x_train = noisy_signal.reshape(-1, 1)
y_train = clean_signal.reshape(-1, 1)

# Define Denoising Autoencoder (DAE) Model
model = tf.keras.Sequential([
    tf.keras.layers.InputLayer(input_shape=(1,)),
    tf.keras.layers.Dense(4, activation='relu', name='encoder'),
    tf.keras.layers.Dense(2, activation='relu', name='bottleneck'),
    tf.keras.layers.Dense(4, activation='relu', name='decoder_hidden'),
    tf.keras.layers.Dense(1, activation='linear', name='output')
])

# Compile Model
model.compile(optimizer='adam', loss='mean_squared_error')

# Train Model
model.fit(x_train, y_train, epochs=100, batch_size=32, verbose=1)

# Save Weights to Text File
with open('weights.txt', 'w') as f:
    for layer in model.layers:
        weights = layer.get_weights()
        if len(weights) > 0:
            f.write(f'Layer: {layer.name}\n')
            for w in weights:
                np.savetxt(f, w, fmt='%0.6f')
                f.write('\n')

print("Trained weights saved to weights.txt")

