From: GoatZilla <goatzilla@gmail.com>
Subject: Re: help using Harold Milz patch for PSB overide
Date: Mon, 23 Aug 2004 17:06:03 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <39e34848040823140664ae1f6@mail.gmail.com>
References: <20040821154720.736.qmail@web86901.mail.ukl.yahoo.com>
	<20040823191148.4DE434BE9F@nathan.muc.de>
Reply-To: GoatZilla <goatzilla@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040823191148.4DE434BE9F@nathan.muc.de>
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

Ah, and I had forgotten about all the other modules needed to get the
powernow module working.  Instead of insmod, try using modprobe, which
if set up correctly will load the rest of the modules that you need.



> > as I monitor temps I should be fairly safe.  I doubt
> > my board will allow changes in voltage anyway.
> 
> Yup - the SoftVID pins are hardly ever connected on desktop boards -
> although I've read about some mods in various fora. Which is nonsense,
> marketing-wise. Connecting the pins costs about 0.00002$.


I think the official recipe from AMD actually involves using a
multiplexer IC, not just wiring SoftVID to the VRM.  So it's different
(more) wiring + another IC on the board.
