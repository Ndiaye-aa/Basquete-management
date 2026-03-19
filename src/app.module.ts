import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TimeModule } from './time/time.module';
import { CampeonatoModule } from './campeonato/campeonato.module';
import { JogadorModule } from './jogador/jogador.module';

@Module({
  imports: [TimeModule, CampeonatoModule, JogadorModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
