From: =?iso-8859-1?q?mark=20newman?= <emergant2000@yahoo.co.uk>
Subject: Re: help using Harold Milz patch for PSB overide
Date: Mon, 23 Aug 2004 23:28:46 +0100 (BST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040823222846.18763.qmail@web86904.mail.ukl.yahoo.com>
References: <39e34848040823140664ae1f6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <39e34848040823140664ae1f6@mail.gmail.com>
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
To: Cpufreq@www.linux.org.uk

modprobe gave me no such device messages. I'm not on
the media box at the moment,but from memory dmesg
showed no pst etc (see my earlier message) ie the
normal behaviour when no freuency table is available. 
This is as expected when no fid's etc are provided
using insmod.  I am however wonderring if all the
relevant dependencies were loaded.  I'll check on
this.

Mark 


--- GoatZilla <goatzilla@gmail.com> wrote: 
> Ah, and I had forgotten about all the other modules
> needed to get the
> powernow module working.  Instead of insmod, try
> using modprobe, which
> if set up correctly will load the rest of the
> modules that you need.
> 
> 
> 
> > > as I monitor temps I should be fairly safe.  I
> doubt
> > > my board will allow changes in voltage anyway.
> > 
> > Yup - the SoftVID pins are hardly ever connected
> on desktop boards -
> > although I've read about some mods in various
> fora. Which is nonsense,
> > marketing-wise. Connecting the pins costs about
> 0.00002$.
> 
> 
> I think the official recipe from AMD actually
> involves using a
> multiplexer IC, not just wiring SoftVID to the VRM. 
> So it's different
> (more) wiring + another IC on the board.
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>  


	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun!  http://uk.messenger.yahoo.com
