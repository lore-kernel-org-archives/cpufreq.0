From: tarek attia <tarek.m.attia@gmail.com>
Subject: CPUFREQ on FriendlyArm
Date: Sun, 5 Sep 2010 17:47:53 +0200
Message-ID: <AANLkTikjz13No=o-E39qE6xWdOBrzrJJQWfN-noWm7zP@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=mklNLCdFuNu61cXmi2MLee+3rNUILg+0uDod7qbPqtM=;
        b=nllnYUtT1mmwrEqG1+YJchmakRJO0cXTN8WZj8KM1jezthUzzb9odxndI/amdlf7XZ
         rTcorOVozK8NrwoCo1dWt+inckzYD8lTL0wDy34Fbb/YnkKJG3NgsUBkKTNo2Sq5Xbzm
         9TKtAoPgOk5od+d1ZR4AqrnDCziZy6cXO2rvU=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi all,

Did anyone try the cpufreq on the mini2440 ? and did anyone get it
working on the board ?

Each time I do the configuration in the kernel I found nothing on the
board ,however after the compilation I found the cpufreq.o & pll.o but
no file concerning that on the board .


Any help will be appreciated.


Best Regards,
-- 
Tarek
