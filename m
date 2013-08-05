From: Mike Turquette <mike.turquette@linaro.org>
Subject: Re: power measurement
Date: Mon, 05 Aug 2013 11:10:24 -0700
Message-ID: <20130805181024.5348.36824@quantum>
References: <611CFE9D6FBBDC4B97935A5287A11345012E5E@XSERVER21B.campus.tue.nl>
 <20130731035831.24490.50438@quantum>
 <611CFE9D6FBBDC4B97935A5287A11345023609@XSERVER21B.campus.tue.nl>
 <CAAfg0W6ozSRRMVdSYFdifSwHC=-hasL4DX1aDzFBoGRawb1hXg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAAfg0W6ozSRRMVdSYFdifSwHC=-hasL4DX1aDzFBoGRawb1hXg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andy Green <andy.green@linaro.org>, "Comaschi, F." <fcomaschi@tue.nl>
Cc: "linux-pm@lists.linux-foundation.org" <linux-pm@lists.linux-foundation.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Quoting Andy Green (2013-08-05 01:32:41)
> On 1 August 2013 14:26, Comaschi, F. <fcomaschi@tue.nl> wrote:
> 
> Somehow this just appeared today.
> 
> > Dear Mike,
> >
> > yes I have seen Andy's presentation about using AEP, and I had the impression that some measurements would have been possible on my board. Could you tell me which is the exact reason why it is more advisable to use a NI DAQ rather than a AEP? I thought that an AEP would have integrated better with the ARM development chain of DS5.
> >
> > Also, could you please tell me what do you exactly mean by "Solder sense
> > resistors across exposed capacitors"?
> 
> I think Mike must have meant inductors; since the capacitors are
> between the rail and 0V adding the shunts there will result in a
> direct short across the rail hopefully triggering something's
> overcurrent detection or if not "letting the smoke out" of your
> low-value shunt resistor.
> 
> (Also /Gross/Green/ ^^)

Two embarrassing mistakes in one email. Yes I meant inductors and not
caps. Please leave the caps alone. Thanks for the corrections Andy.

Regards,
Mike

> 
> > Does it mean inserting a shunt resistors in series to an existing capacitor on the board? Would you or somebody else be able to suggest me any of such capacitors on the Arndale board?
> > According to Andy' s presentation, I thought that the best way to do power measurement was rather looking for inductors on the input side of power regulators, and replace those ones with shunt resistors.
> 
> That is correct.
> 
> > Looking at the enclosed schematic, Andy told me that unfortunately it seems like the Arndale 5250 does not present any suitable spot where to perform accurate power measurements.
> 
> I couldn't see anything useful to measure ARM Vcore, which is ironic
> since there are so many other rails with shunt resistors already on
> that board.
> 
> -Andy
> 
> > Could you please tell me more about this?
> >
> > Thanks again for all the provided information.
> >
> > Best regards,
> >
> > Francesco
> >
> > ________________________________________
> > From: Mike Turquette [mike.turquette@linaro.org]
> > Sent: Wednesday, July 31, 2013 5:58 AM
> > To: Comaschi, F.
> > Subject: Re: power measurement
> >
> > Quoting Comaschi, F. (2013-07-10 05:49:36)
> >> Dear Mike,
> >>
> >> I am Francesco Comaschi, a researcher at Eindhoven University of Technology. I am sending you this email because my group is interested in purchasing an ARM-powered board where to measure power consumption with the highest accuracy possible.
> >> Ideally, the board we are looking for has the following characteristics:
> >>
> >> -) options for power-saving strategies (DVFS and power gating);
> >> -) options for measuring power consumption on the board (possibly via software, maybe using lm_sensors), or via hardware otherwise (maybe using ARM Energy Probe?);
> >> -) support available: since I do not have much experience, i would rather choose an option where either some work has already been done in terms of power management/power measurements, or some sort of support would be guaranteed (for example, regarding the Arndale board I could not get to work the DVFS through Linaro, and so far I didn'get any answer/feed-back from In Signal).
> >>
> >> Also, if you have any documentation/tutorial/reference to suggest me in order to understand how to properly perform DVFS/power gating on one of the boards supported by Linaro, I would be really grateful.
> >> I was considering, among the others, the Arndale dual-board (that we already have), the Origen quad-core board and the Panda board. Also the Versatile Express family from ARM is very attractive of course, but terribly expensive.
> >
> > Hi Francesco,
> >
> > Arndale and Panda are both good options which have some support upstream
> > for DVFS and power gating.
> >
> >> I have read about the possibility of using the AEP to measure energy on device:
> >> http://www.linaro.org/documents/download/3f44bb2b53ebd7ef498202d496c8cadd5093c0a862c4a
> >> and I was wandering if anything similar has been already done on the Origen and the Arndale.
> >
> > AEP is very limiting. Did you see Andy Gross' presentation on using the
> > AEP? It might be good for observing some DVFS transitions, but is
> > essentially useless for high-accuracy low-power idle transitions.
> >
> > It is important to know that measuring high-performance workloads is not
> > the same as measuing low power workloads. You might choose different
> > resistor values depending on whether you are interested in measuring
> > active frequency scaling versus idle power gating.
> >
> > There is still no easy way to do this. I suggest purchasing a National
> > Instruments DAQ, one of the USB 6000 series should be good. Solder sense
> > resistors across exposed capacitors on the boards and measure that way.
> > It is how most of us do it when we want to get serious about measuring
> > power.
> >
> > If you have further questions please Cc the Linux ARM kernel mailing
> > list. It means more people can answer your questions and future
> > researchers can benefit from your correspondence.
> >
> > Regards,
> > Mike
> >
> >>
> >> Also, from this page:
> >> https://wiki.linaro.org/WorkingGroups/PowerManagement/Matrix1105
> >> is is not clear to me if the cpu_idle and cpu_freq frameworks (which I think are used for power gating and DVFS respectively) are up and running on the mentioned boards, and if it would be possible to manage DVFS and power-gating directly from inside my application.
> >>
> >> Sorry for all the questions, but any help would be very much appreciated.
> >>
> >> Thanks in advance for your kind attention,
> >>
> >> Best regards,
> >>
> >> Francesco Comaschi
> > _______________________________________________
> > linaro-kernel mailing list
> > linaro-kernel@lists.linaro.org
> > http://lists.linaro.org/mailman/listinfo/linaro-kernel
> >
