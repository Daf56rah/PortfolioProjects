select *
from PortfolioProject.dbo.CovidDeaths
where continent is not null
order by 3,4

--select *
--from PortfolioProject.dbo.CovidVaccinations
--order by 3,4

select location, date, total_cases, new_cases, total_deaths, population 
from PortfolioProject.dbo.CovidDeaths
order by 1,2

select location, date, total_cases,total_deaths,(total_deaths/total_cases)*100 as percentage_of_deaths
from PortfolioProject.dbo.CovidDeaths
where location like '%uganda%'
order by 1,2

select location, date, population, total_cases,(total_cases/population)*100 as percentage_of_population_with_covid
from PortfolioProject.dbo.CovidDeaths
--where location like '%uganda%'
order by 1,2

select location, population,max(total_cases) as high_infection_count, max((total_cases/population))*100 as percentage_of_populationInfected
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%'
group by location,population
order by percentage_of_populationInfected desc

select location, max(cast(total_deaths as int)) as totalDeathCount
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%'
where continent is not null
group by location
order by totalDeathCount desc

select continent, max(cast(total_deaths as int)) as totalDeathCount
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%'
where continent is not null
group by continent
order by totalDeathCount desc

select continent, max(cast(total_deaths as int)) as totalDeathCount
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%'
where continent is not null
group by continent
order by totalDeathCount desc

select location, date, population, total_cases,(total_cases/population)*100 as percentage_of_population_with_covid
from PortfolioProject.dbo.CovidDeaths
--where location like '%uganda%'
where continent is not null
order by 1,2

select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases) as deathPercentage
from PortfolioProject.dbo.CovidDeaths
--where location like '%uganda%'
where continent is not null
--group by date
order by 1,2


select*
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3


