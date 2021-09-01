import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { GithubModule } from './github/github.module';

@Module({
  imports: [AuthModule, GithubModule],
  controllers: [AppController],
  providers: [AppService],
})

export class AppModule {}
