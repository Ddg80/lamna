import 'package:flutter_test/flutter_test.dart';
import 'package:lamna/models/itinerary.dart';
import 'package:lamna/models/travel.dart';
import 'package:lamna/provider/global_provider.dart';

// Mock classes for Travel, Itinerary, and others as needed

void main() {
  test('isSelectedTravel returns true for selected travel', () {
    final provider = GlobalProvider();
    final travel = Travel(
      id: 1,
      startHour: "10:34",
      cityStart: "Rennes",
      finishHour: "15:22",
      cityFinish: "Rouen Rive droite",
      pricePerPerson: 51.00,
      timeTravel: "4:54",
      percent: 5,
      category: "Train",
      travelType: "Retour",
    );

    provider.setTravelSelected(travel);
    expect(provider.isSelectedTravel(travel), true);
  });

  test('setSingleItineraryLike sets like for an itinerary', () {
    final provider = GlobalProvider();
    final itinerary1 = Itinerary(
      id: 1,
      nameCity: "Rennes",
      titleItinerary: "Rennes",
      subtitleItinerary: "au fil de l'eau",
      image: "assets/itineraryCards/route1.png",
      smallImage: "assets/miniCardsItineraries/route1S.png",
      nbSite: 12,
      distance: 27.4,
      days: 2,
      createdBy: "assets/labelsItineraries/createdByDestinationRennes.png",
      headerImage: "assets/auFilDeLeau/header.png",
      description:
          "Explorez Rennes à travers ses cours d'eau, découvrant ses quais pittoresques et ses parcs verdoyants bordés d'eau, offrant une perspective paisible de la ville.",
      images: [
        "assets/auFilDeLeau/image1.png",
        "assets/auFilDeLeau/image2.png",
        "assets/auFilDeLeau/image3.png",
        "assets/auFilDeLeau/image4.png"
      ],
      like: true,
    );
    final itinerary2 = Itinerary(
      id: 2,
      nameCity: "Rennes",
      titleItinerary: "Rennes",
      subtitleItinerary: "au fil de l'eau",
      image: "assets/itineraryCards/route1.png",
      smallImage: "assets/miniCardsItineraries/route1S.png",
      nbSite: 12,
      distance: 27.4,
      days: 2,
      createdBy: "assets/labelsItineraries/createdByDestinationRennes.png",
      headerImage: "assets/auFilDeLeau/header.png",
      description:
          "Explorez Rennes à travers ses cours d'eau, découvrant ses quais pittoresques et ses parcs verdoyants bordés d'eau, offrant une perspective paisible de la ville.",
      images: [
        "assets/auFilDeLeau/image1.png",
        "assets/auFilDeLeau/image2.png",
        "assets/auFilDeLeau/image3.png",
        "assets/auFilDeLeau/image4.png"
      ],
      like: false,
    );

    provider.setItineraries([itinerary1, itinerary2]);
    provider.setSingleItineraryLike(true, 1);
    expect(provider.getSingleItinerary(1)[0].like, false);

    provider.setSingleItineraryLike(false, 2);
    expect(provider.getSingleItinerary(2)[0].like, true);

    provider.notifyListeners();
  });

  test('getCurrentNbItineraryLiked calculates liked itineraries', () {
    final provider = GlobalProvider();
    final itinerary1 = Itinerary(
      id: 1,
      nameCity: "Rennes",
      titleItinerary: "Rennes",
      subtitleItinerary: "au fil de l'eau",
      image: "assets/itineraryCards/route1.png",
      smallImage: "assets/miniCardsItineraries/route1S.png",
      nbSite: 12,
      distance: 27.4,
      days: 2,
      createdBy: "assets/labelsItineraries/createdByDestinationRennes.png",
      headerImage: "assets/auFilDeLeau/header.png",
      description:
          "Explorez Rennes à travers ses cours d'eau, découvrant ses quais pittoresques et ses parcs verdoyants bordés d'eau, offrant une perspective paisible de la ville.",
      images: [
        "assets/auFilDeLeau/image1.png",
        "assets/auFilDeLeau/image2.png",
        "assets/auFilDeLeau/image3.png",
        "assets/auFilDeLeau/image4.png"
      ],
      like: true,
    );
    final itinerary2 = Itinerary(
      id: 2,
      nameCity: "Rennes",
      titleItinerary: "Rennes",
      subtitleItinerary: "au fil de l'eau",
      image: "assets/itineraryCards/route1.png",
      smallImage: "assets/miniCardsItineraries/route1S.png",
      nbSite: 12,
      distance: 27.4,
      days: 2,
      createdBy: "assets/labelsItineraries/createdByDestinationRennes.png",
      headerImage: "assets/auFilDeLeau/header.png",
      description:
          "Explorez Rennes à travers ses cours d'eau, découvrant ses quais pittoresques et ses parcs verdoyants bordés d'eau, offrant une perspective paisible de la ville.",
      images: [
        "assets/auFilDeLeau/image1.png",
        "assets/auFilDeLeau/image2.png",
        "assets/auFilDeLeau/image3.png",
        "assets/auFilDeLeau/image4.png"
      ],
      like: false,
    );

    provider.setItineraries([itinerary1, itinerary2]);
    provider.getCurrentNbItineraryLiked();
    expect(provider.getCountItinerarySelected(), 1);
  });

  test('setReservationSelected sets form reservation data', () {
    final provider = GlobalProvider();
    final data = {'startDate': '2024-03-08', 'returnDate': '2024-03-10'};

    provider.setReservationSelected(data);
    expect(provider.getStartDate(), '2024-03-08');
    expect(provider.getReturnDate(), '2024-03-10');

    provider.notifyListeners();
  });

  test('getSettings returns the list of settings', () {
    final provider = GlobalProvider();
    final settings = provider.getSettings();

    expect(settings.length, 5);
    expect(settings[0].title, 'Compte');
    expect(settings[1].title, 'Apparence');
  });

  test('getLogoutSettings returns the logout setting', () {
    final provider = GlobalProvider();
    final logoutSetting = provider.getLogoutSettings();

    expect(logoutSetting.title, 'Logout');
    expect(logoutSetting.subtitle, 'A bientôt !');
  });

  test('setIdCityChoose sets the selected city ID', () {
    final provider = GlobalProvider();
    const idCity = 1;

    provider.setIdCityChoose(idCity);
    expect(provider.getIdCity(), idCity);
  });

  test('getLinkCollaboration returns the link', () {
    final provider = GlobalProvider();
    const link = 'https://www.lamna.com/collaboration';

    provider.setLinkCollaboration(link);
    expect(provider.getLinkCollaboration(), link);
  });

  test('setStartDate and getStartDate work correctly', () {
    final provider = GlobalProvider();
    const newDate = '2024-03-08';

    provider.setStartDate(newDate);
    expect(provider.getStartDate(), newDate);
  });

  test('setReturnDate and getReturnDate work correctly', () {
    final provider = GlobalProvider();
    const newDate = '2024-03-10';

    provider.setReturnDate(newDate);
    expect(provider.getReturnDate(), newDate);
  });
}

class Mastercard {}
