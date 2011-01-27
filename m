From: mihn <mihnsk@gmail.com>
Subject: how to do cpu voltage scaling
Date: Thu, 27 Jan 2011 01:11:11 -0800
Message-ID: <1296119471.4653.2.camel@genix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:content-type:date:message-id
         :mime-version:x-mailer:content-transfer-encoding;
        bh=xtYpjFjJky6+FBoZMZq7K7WIaCLwCy6LHPMekV02Tvw=;
        b=Ku0SxNJvSYGCeg8k7Do9cK01m4zjsb5L3Z7BeRT5MWIIcTJS7gPdMQUmWCo6Mt8kzA
         6GaXWSoT1mwnFQebK0wN+JUl3/TyYfV11OygsFEI3+D/qMXkyR1d8jvDQugIEbrsdBFZ
         irl2j/82WGwg1BTrypbAs7bqOazLOjcDkBPz0=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

Hi,

I want to change voltage and frequency seperately.
With cpu-freq, i can change frequency, but cannot change voltage AFAIK.

Can I do this using cpu-freq?

If possible, how can I set voltage with the fixed value?
If not, is there any way to do that?

FYI, i'm using intel i7-core(nehalem) and ubuntu 10.10.
FYI2, i found out i can do using IA32_PERF_CTL register, but there's no
detail from intel.
FYI3, can i change P-state table so that i can only change voltage in P
states?

Thanks,
mihn


