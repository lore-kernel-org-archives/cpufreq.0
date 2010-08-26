From: Amit Arora <amit.arora@linaro.org>
Subject: Re: [PATCH] Make PowerTOP generic, by removing hard coded values
Date: Thu, 26 Aug 2010 11:02:45 +0530
Message-ID: <AANLkTi=b9+MEF76QxQXq1q5d2+M9S1ie1_TJkzYbOQqc@mail.gmail.com>
References: <1281684356-7454-1-git-send-email-amit.arora@linaro.org>
	<AANLkTimdmQd8m30KuDBMqmXBsjW0zDY9uYpHoXQrJn=L@mail.gmail.com>
	<201008251620.09154.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201008251620.09154.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Renninger <trenn@suse.de>
Cc: power@bughost.org, cpufreq@vger.kernel.org, auke@linux.intel.com, amit.kucheria@linaro.org, yong.shen@linaro.org, vishwanath.bs@ti.com

Hello Thomas,

On Wed, Aug 25, 2010 at 7:50 PM, Thomas Renninger <trenn@suse.de> wrote=
:
> Amit: Your problem seem not to be the 16 static freqs, oldfreqs, delt=
a
> arrays, but that only 6 frequencies max are displayed?:
>
> char cpufreqstrings[6][80];
> ...
> if (maxfreq>4)
> =A0 =A0 =A0 =A0maxfreq=3D4;
> which should limit the frequency information string to 6 lines.
> This you should have to touch?

I had seen the above logic. My aim is not to display all the P states.
Am fine with top 4 (after sorting), how it currently does, and thus
didn't suggest to change this in my patch.

Though in some of the ARM boards the number of P states can be less
than 4. Hence the display won't be nice for such boards.

But, actually its the cpuidle states (C states), which bothers me more
than the P states. The problem is that on some of the ARM boards the
number of C states can be as many as 9 !  And different ARM SoC have
different number of these C and P states. So, its not practical to
have them hardcoded for each board!

Hence, we need a way to dynamically find out the number of C and P
states, and display accordingly. And the same code should ideally work
on x86, ARM and any other architecture that may want to use powertop.

> On the other hand side there already is sorting for most relevant/mos=
tly
> used frequencies and only these are cut out. So if you have 16 (or do
> you really have more?) frequencies you should see the 6 mostly used
> ones, which sounds sane -> display size is limited.

As mentioned above, this is perfectly fine.

The goal here is to have the same code function on x86 and various ARM
SoCs - which have different levels of these C and P states.


Thanks!
Regards,
Amit Arora
