From: Guru Prasad <gurupras@buffalo.edu>
Subject: Fwd: Porting cpufreq module for memory frequency scaling 'memfreq'
Date: Wed, 26 Jun 2013 11:58:16 -0400
Message-ID: <CAMefCkAwdGGeOrJWnkTdbFH8L453LC1Cvo7mh_Ntx0LBSwQv+g@mail.gmail.com>
References: <CAMefCkCXyM4EV92Q==zScae7FzgD2VjmyGx2nTf_u2LK6b6hvQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=IxsOPf7t87d5QGSEXcFn1frs7y1dFTDeFfKXzAXg218=;
        b=zcwle7y0c9mUcN2vi3PxbOCzUl7ci7iakDKXXlPcjFa+BQexUNSf2/MoCI9LpT0Cc3
         Bs8/SZkqJeVWhyk7IDkMv3ONfELtPfCueIxHWpRKEjOhumyDGA/+Bu1CMom2GtJ0YTKj
         FAgdfxHvDI5Sus/LrVAuMCD7zBk1LZ/1OqRVuEgRWuOmQjL3jkETBf9RUAMcXLAbKgKl
         GM1A7C0GCNyc6o3SmgcYBqAmhBKCi5XVaM4LSPR13w264g57BxmUU1b0q6tbd56t7bIu
         6OhiU32JAQ9OSG8GAo1zjCsenJyp4bpk6cyl4eiYMrfvwX30vHX7zT5bZNOr/qpEzrtB
         lELg==
In-Reply-To: <CAMefCkCXyM4EV92Q==zScae7FzgD2VjmyGx2nTf_u2LK6b6hvQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,

I'm working with a hardware simulator - Gem5 (http://gem5.org). I have
added some functionality to this simulator to modify memory frequency.

I would like to add kernel support to manage memory frequency similar
to how cpu frequency is currently maintained so that I can study the
cost-benefit of memory frequency scaling.

I copied all the generic cpufreq sources to a separate folder
kernel_source/drivers/memfreq and setup the drivers/Makefile. I have
also done the preliminary Kconfig modifications.

A few things I don't follow are

Where does the kernel actually implement the delay resulting from
cpuinfo.transition_latency?
Does the kernel stall for the duration of the delay?

the per_cpu macro        - I don't understand what this does..How can
I implement the same for memory - which I'm considering as a shared
resource rather than per_cpu.

the subsys interface      - What does it do and how do I reproduce
this for memory? Can I use the existing bus_type memory_subsys?
(drivers/base/memory.c)

callback                       - This seems to be specific for
CONFIG_HOTPLUG_CPU..do I need to implement this at all for memfreq?

sysfs interface              - Is there any place I can look to
implement a nice sysfs interface similar to cpufreq?


Please let me know if there is anything I've missed out that might
complicate the process.


Regards
Guru
