From: aeriksson@fastmail.fm
Subject: Re: Pentium III (Coppermine) cpufreq support
Date: Thu, 29 Jan 2004 10:31:05 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040129093110.5E7FF3F60@latitude.mynet.no-ip.org>
References: <ducrot@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: Message from Ducrot Bruno <ducrot@poupinou.org> of "Thu,
	29 Jan 2004 12:35:41 +0100." <20040129113541.GY25416@poupinou.org> 
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
Cc: cpufreq@www.linux.org.uk, aeriksson2@fastmail.fm


> > Now reading the comment just before these lines, it's
> > apparent that this is not the way things are supposed to work.
> 
> Well, that the only 'official' info we got from Intel in
> order to detect a speedstep capable processor in earlier
> PIII coppermine...  But they seems to be wrong (and actually
> some system do have an early speedstep-capable PIII coppermine
> that do not pass this check).
> 
Sounds promising.

> > Question:
> > Is there any chance that tricking the code into accepting 
> > the cpu as speedstep-capable, would made the code appear to
> > work when observing the behavior from outside but actually
> > do no good to the metal? I don't have the hardware here to 
> > check if the box actually does consume less power when in
> > low performance mode.
> 
> If you allow a non-speedstep capable processor, and if
> you use the speedstep-ich driver, this will likely
> freeze the system no matter what.
> 
-ich. ? Do you mean -smi? That's the one I use...

Anyway, I guess I can conclude that i do have a speedstep capable box.
If we can get feedback from others (e.g. visyz) indicating that this
test may need to be relaxed/fixed/whatever a bit for different boxes,
would a CONFIG_CPUFREQ_ANCIENT_SPEEDSTEP patch & option which
captures that be adopted?

/Anders
