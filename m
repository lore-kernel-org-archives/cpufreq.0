From: =?iso-8859-1?q?mark=20newman?= <emergant2000@yahoo.co.uk>
Subject: Re: help using Harold Milz patch for PSB overide
Date: Sat, 28 Aug 2004 22:47:39 +0100 (BST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040828214739.16902.qmail@web86909.mail.ukl.yahoo.com>
References: <39e3484804082813517f360dbf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <39e3484804082813517f360dbf@mail.gmail.com>
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
To: GoatZilla <goatzilla@gmail.com>, cpufreq@www.linux.org.uk


Thanks, I'd been looking for that document.


I have a feeling I'm missing something too.  I'll post
again if I figure it out, but at the moment I'm at a
loss.  I can't even figure out how to track the
problem.

Mark 


 --- GoatZilla <goatzilla@gmail.com> wrote: 
>
http://www.tldp.org/HOWTO/Athlon-Powersaving-HOWTO/approaches.html
> 
> It's an example of how to use the setpci command,
> and also happens to
> be instructions for turning on the bus disconnect
> feature for
> squeezing that last bit of energy savings out.  It
> looks like one of
> the disconnect bits is in the same register as this
> p-state transition
> bit.  Stop to take a look at the command and learn
> how to use it
> first, and use it to READ your register value before
> setting it.
> 
> My x86info tells me my FID won't change, but I can
> still change it
> somehow.  I never had to do any PCI tweaking to get
> my FID changes to
> work.  This may very well be motherboard
> dependant...  but I still
> think you've done something else wrong.
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>  


	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun!  http://uk.messenger.yahoo.com
