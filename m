From: aeriksson2@fastmail.fm
Subject: Re: Pentium III (Coppermine) cpufreq support
Date: Thu, 29 Jan 2004 14:18:19 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040129131820.512DF3F60@latitude.mynet.no-ip.org>
References: <ducrot@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: Message from Ducrot Bruno <ducrot@poupinou.org> of "Thu,
	29 Jan 2004 15:26:35 +0100." <20040129142635.GB25416@poupinou.org> 
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


Ducrot Bruno <ducrot@poupinou.org> said:
> > > And?  This code is shared with *all* speedstep drivers.
> > > 
> > 
> > I know the detection code is shared. I assumed that the failure modes
> > might be different for the different divers. I.e. a mis-detected cpu
> > using the ich driver might cause a hang, while a mis-detected cpu on
> > the -smi driver might cause a small fire, be undetected, whatever.
> > Maybe that's a wromng assumption.
> 
> The fact that a mis-detected cpu in the ich case introduce a freeze
> of a system is enough to not include your patch in this form, no matter
> if it is safe (and I believe that it is the case) in the smi case.
> 
OK. Right. I agree. Another solution is needed, then.

<snip>
> Systems that support SMI call, but do not pass the speedstep capabilty
> check.  There is even one that do not support the int15 check, that
> do not pass the speedstep capabitility check, but speedstep-smi driver
> work.
> 
> Therefore, there is no need to get feedback for this particular point,
> because it is already well known (at least by me) and I must admit
> that I should have fixed, and documented, this problem (my fault,
> my big fault, sorry)...

Fixed as in fixing code somewhere, or "just" document that it doesn't
work (and perhaps never will)? If you have a plan for code mods to get
this to work, please announce it and I/we can start hacking on it. I
don't like having to patch the source for each upgrade...

Do we need more data points? I know my patch removes two bits from the
test pattern. I have not checked if that's needed, or which bit is the
offender. Should I check that, or is the culprit elsewhere?


/A
