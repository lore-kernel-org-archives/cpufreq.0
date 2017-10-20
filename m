From: Micha W <cellmw@gmail.com>
Subject: cpufreq debian 9, intel i7 908x
Date: Fri, 20 Oct 2017 11:41:54 +0200
Message-ID: <1508492514.4018.1.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:mime-version
         :content-transfer-encoding;
        bh=k06ggXKCA5xM9/i/DutH67Vk3Vs1iSxgbZ0Lr15m0jc=;
        b=R4BAd6yAj/2rTdUkxfRl0MXBfPOKjS0o/mRuhVHVyPvP1U7NgeGv41kR2LAeG/lE3P
         RJQjS0PceCBsmLzqJUlGhqIEIzyHi9k+woQvIZYEXEk9YBAUuXN7uIOxQt6vpyyjn6ZI
         7FXJjSt1QfbNT+xqLjJ16NOTaqi7e9OmsDN5XGJo3ry71RaPtz400F7Bf6CSdsWu1LdV
         vi0b2i0dvEgCLx7jXlb1PKpgESCyYhiz7fWWhtJ8yhH8FdvFl38DsRolp8vTm59zAGUx
         PgtqwRPc5fJPT4TqvJyoUhL1VKCPVUihbPu9VkLFn6l1eoIFnqkmseCeOyXJT7rHWQd3
         oCgQ==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

Hi Dominik, i got this error, using cpufreq on my intel i7 980x,

do you have any info on using the performance settings correctly?

It says there is no driver active....

Thanks and greetings, 
Micha


root@monster:/home/micha# cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
analysiere CPU 0:
  kein oder nicht bestimmbarer cpufreq-Treiber aktiv
  Maximale Dauer eines Taktfrequenzwechsels: 4294.55 ms.
analysiere CPU 1:
  kein oder nicht bestimmbarer cpufreq-Treiber aktiv
  Maximale Dauer eines Taktfrequenzwechsels: 4294.55 ms.
analysiere CPU 2:
  kein oder nicht bestimmbarer cpufreq-Treiber aktiv
  Maximale Dauer eines Taktfrequenzwechsels: 4294.55 ms.
analysiere CPU 3:
  kein oder nicht bestimmbarer cpufreq-Treiber aktiv
  Maximale Dauer eines Taktfrequenzwechsels: 4294.55 ms.
analysiere CPU 4:
  kein oder nicht bestimmbarer cpufreq-Treiber aktiv
  Maximale Dauer eines Taktfrequenzwechsels: 4294.55 ms.
analysiere CPU 5:
  kein oder nicht bestimmbarer cpufreq-Treiber aktiv
  Maximale Dauer eines Taktfrequenzwechsels: 4294.55 ms.
