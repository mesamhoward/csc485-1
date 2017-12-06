def __init__(self, transducer, sess, config, word_embeddings):
    self.transducer = transducer
        # we have to store the session here in order to avoid passing
        # the session to minibatch_parse. Don't try this at home!
        self.sess = sess
        self.word_embeddings = word_embeddings
        self.config = config
        self.build()

class Config(object):
    """Holds model hyperparams and data information.
        
        The config class is used to store various hyperparameters and dataset
        information parameters. Model objects are passed a Config() object at
        instantiation.
        """
    n_word_ids = None # inferred
    n_tag_ids = None # inferred
    n_deprel_ids = None # inferred
    n_word_features = None # inferred
    n_tag_features = None # inferred
    n_deprel_features = None # inferred
    n_classes = None # inferred
    dropout = 0.5
    embed_size = None # inferred
    hidden_size = 200
    batch_size = 2048
    n_epochs = 10
    lr = 0.001

    self.word_id_placeholder = tf.placeholder(tf.int32, shape=(None, self.config.n_word_features))
    self.tag_id_placeholder = tf.placeholder(tf.int32, shape=(None, self.config.n_tag_features))
    self.deprel_id_placeholder = tf.placeholder(tf.int32, shape=(None, self.config.n_deprel_features))
    self.class_placeholder = tf.placeholder(tf.float32, shape=(None, self.config.n_classes))
    self.dropout_placeholder = tf.placeholder(tf.float32, shape=None)

20 4003
Word feat size: 18, tag feat size: 18, deprel feat size: 12,
embed: 50 class: 83
hidden: 200
word feat: 18 tag feat: 18 depre: 12
