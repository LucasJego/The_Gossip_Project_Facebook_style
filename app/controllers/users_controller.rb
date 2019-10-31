class UsersController < ApplicationController
	def index
  # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
end

def show
  @user = User.find(params[:id])
  @city = City.all
end

def new
  # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  puts 'i' * 60
  puts params
end

def create
  # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
  # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  puts "-" * 60
  puts params
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], age: params[:age], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  puts "#" * 60
  puts @user
  puts @user.email
  puts "b" * 60

  # Si le programme arrive à effectuer la sauvegarde de l'utilisateur dans la BDD
  # i.e. si les champs ont été remplis correctement,
  	if @user.save
  		# Le programme affiche une fenêtre avec 'Inscription validée' écrit
      flash.now[:success] = 'Inscription validée'
      # L'utilisateur est renvoyé à la page qui affiche tous les potins
      redirect_to gossips_path
    else
    	# Si les infos rentrés ne sont pas bonnes, le programme affiche un message d'alerte
    	flash.now[:danger] = 'Inscription non valide'
    	render new_user_path
    end


end

def edit
  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
end

def update
  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
end

def destroy
  # Méthode qui récupère le potin concerné et le détruit en base
  # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
end
end
