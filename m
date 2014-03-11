From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: v3.13.5 intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Tue, 11 Mar 2014 20:50:28 +0100
Message-ID: <3356262.4cDuororSJ@vostro.rjw.lan>
References: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com> <531F4EE3.4080701@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <531F4EE3.4080701@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Patrik Lundquist <patrik.lundquist@gmail.com>, cpufreq@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>

On Tuesday, March 11, 2014 10:58:59 AM Dirk Brandewie wrote:
> Hi Patrick,
> 
> Sorry for the slow response you caught me taking a few days off :-)
> 
> On 03/07/2014 07:49 AM, Patrik Lundquist wrote:
> > Hi,
> >
> > booting 3.13.5 on a dual socket Ivy Bridge-EP resulted in this error:
> >
> > [    0.194139] smpboot: CPU0: Intel(R) Xeon(R) CPU E5-2687W v2 @
> > 3.40GHz (fam: 06, model: 3e, stepping: 04)
> > ...
> > [    0.246755] x86: Booting SMP configuration:
> > [    0.250935] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
> > [    0.357648] .... node  #1, CPUs:    #8  #9 #10 #11 #12 #13 #14 #15
> > [    0.553293] x86: Booted up 2 nodes, 16 CPUs
> > [    0.557666] smpboot: Total of 16 processors activated (108850.19 BogoMIPS)
> > ...
> > [    5.210204] Intel P-state driver initializing.
> > [    5.232407] Intel pstate controlling: cpu 0
> > [    5.253628] Intel pstate controlling: cpu 1
> > [    5.274899] cpufreq: __cpufreq_add_dev: ->get() failed
> > [    5.294856] Intel pstate controlling: cpu 2
> > [    5.313553] Intel pstate controlling: cpu 3
> > [    5.332526] Intel pstate controlling: cpu 4
> > [    5.352347] Intel pstate controlling: cpu 5
> > [    5.372112] Intel pstate controlling: cpu 6
> > [    5.391097] Intel pstate controlling: cpu 7
> > [    5.410272] Intel pstate controlling: cpu 8
> > [    5.429092] Intel pstate controlling: cpu 9
> > [    5.447714] Intel pstate controlling: cpu 10
> > [    5.465872] Intel pstate controlling: cpu 11
> > [    5.482942] Intel pstate controlling: cpu 12
> > [    5.498414] Intel pstate controlling: cpu 13
> > [    5.513586] Intel pstate controlling: cpu 14
> > [    5.529200] Intel pstate controlling: cpu 15
> >
> > CPU 1 is alive and well but missing the cpufreq driver. The system is
> > running fine otherwise.
> 
> This is a regression introduced by commit
> da60ce9f2fa cpufreq: call cpufreq_driver->get() after calling ->init()
> 
> 
> A return of zero from cpufreq_driver->get() is a warning at best for
> intel_pstate at init time.  In fact zero is a valid return value AFAICT.

Well, is it?  So what is the 0 supposed to mean?

Rafael

