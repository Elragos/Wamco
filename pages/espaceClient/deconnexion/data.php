<?php

// Détruire la session
destroySession();

// Rediriger sur la page de connexion client
header("Location: " . getAbsoluteURL("espaceClient/index"));  
// Fin du script
exit();
