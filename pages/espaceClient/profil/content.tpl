<div id="client-profil">
    <form action="{absoluteURL page="espaceClient/profil" action=true}" method="POST">
        <fieldset>
            <legend>identité</legend>

            <div class="content-form-input">
                <label for="Nom">
                    Nom *
                </label>
                <input type="text" id="Nom" name="Nom" value="{$client->nom}" required />
            </div>

            <div class="content-form-input">
                <label for="Prenom">
                    Prénom *
                </label>
                <input type="text" id="Prenom" name="Prenom" value="{$client->prenom}" required />
            </div>

            <div class="content-form-input">
                <label for="EstSociete">
                    Je suis une société
                </label>
                <input type="checkbox" id="EstSociete" name="EstSociete" {if $client->estSociete}checked{/if} />
            </div>

            <div class="content-form-input">
                <label for="DateNaissance">
                    Date de naissance
                </label>
                <input type="date" id="DateNaissance" name="DateNaissance"  value="{$client->dateNaissance|date_format:"%Y-%m-%d"}" />
            </div>

            <div class="content-form-input">
                <label for="SIRET">
                    SIRET
                </label>
                <input type="text" id="SIRET" name="SIRET" value="{$client->SIRET}" />
            </div>

            <div class="content-form-input">
                <label for="RaisonSociale">
                    Raison sociale
                </label>
                <input type="text" id="RaisonSociale" name="RaisonSociale" value="{$client->raisonSociale}" />
            </div>

            <div class="content-form-input">
                <label for="IdSecteurActivite">
                    Secteur d'activité
                </label>
                <select id="IdSecteurActivite" name="IdSecteurActivite">
                    <option value="0"> -- Non précisé -- </option>
                    {foreach from=$secteursActivite item=secteur}
                        <option value="{$secteur->id}" {if $client->secteurActivite != null && $client->secteurActivite->id == $secteur->id}selected{/if} >
                            {$secteur->nom}
                        </option>
                    {/foreach}
                </select>
            </div>
        </fieldset>

        <fieldset>
            <legend>wam</legend>
            <div class="content-form-input">
                <label for="Password">
                    Mot de passe
                    {if $client->id != 0}
                        (Laisser vide pour ne pas modifier)
                    {else}
                        *
                    {/if}
                </label>
                <input type="password" id="Password" name="Password" {if $client->id == 0}required{/if}  />
            </div>
        </fieldset>

        <fieldset>
            <legend>contacts</legend>
            
            <div class="content-form-input">
                <label for="Telephone">
                    Téléphone
                </label>
                <input type="text" id="Telephone" name="Telephone" value="{$client->telephone}" />
            </div>
            
            <div class="content-form-input">
                <label for="Mail">
                    Mail *
                </label>
                <input type="text" id="Mail" name="Mail" value="{$client->mail}" required />
            </div>
        </fieldset>

        <fieldset>
            <legend>adresse</legend>
            
            <div class="content-form-input">
                <label for="Adresse1">
                    Addresse *
                </label>
                <input type="text" id="Adresse1" name="Adresse1" value="{$client->adresse->ligne1}" required />
            </div>
            
            <div class="content-form-input">
                <label for="Adresse2">
                    Complément d'adresse 
                </label>
                <input type="text" id="Adresse2" name="Adresse2" value="{$client->adresse->ligne2}" />
                <input type="text" id="Adresse3" name="Adresse3" value="{$client->adresse->ligne3}" />
            </div>
            
            <div class="content-form-input">
                <label for="CodePostal">
                    Code Postal *
                </label>
                <input type="text" id="CodePostal" name="CodePostal" value="{$client->adresse->codePostal}" required />
            </div>
            
            <div class="content-form-input">
                <label for="Ville">
                    Ville *
                </label>
                <input type="text" id="Ville" name="Ville" value="{$client->adresse->ville}" required />
            </div>
        </fieldset>
        <input type="submit" value="Valider" />
    </form>
</div>
