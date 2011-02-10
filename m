From: mihn leigh <mihnsk@gmail.com>
Subject: cpu voltage scaling
Date: Wed, 9 Feb 2011 23:59:28 -0800
Message-ID: <AANLkTinAE8-Nu6kUnnEMLxL3=ZJoKS2n3qTwpHBEVyY_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=ULiJXdysshtN15QecyMsy0JivJmzSdSo9QeGxsmy2hc=;
        b=IP8a5Fw+pvO97/oWqfb87V8JBdcPBQ/gOeyHGyMeKm0w0S4IYEtpB3HYbA5foe76Kf
         mSJwV+7OuMqF3fZ4qyubMVwOIxmSVcLGHjUPLkpqJz3/FhGuUREbgGqFXbXJDOeHMcbO
         L5HotV0+zMFd3LRlTtPkn/sD6DIg19KaobI4Y=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,

I want to change voltage and frequency seperately in intel i7 core(nehalem).
With cpu-freq, i can change frequency, but cannot change voltage AFAIK.

I tried PHC "http://www.linux-phc.org", but change of voltage leads to
frequency as well.
Also, i tried to change IA32_PERF_CTL(MSR) register, but i also failed
to fix the frequency while changing the voltage.

Now, i have a plan to dig into PPC table, but i'm not sure if it's
possible or not.
Could you guys give me some infomartion how to change voltage seperately?

Thanks,
mihn
