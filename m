From: GoatZilla <goatzilla@gmail.com>
Subject: Re: help using Harold Milz patch for PSB overide
Date: Sat, 28 Aug 2004 15:51:48 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <39e3484804082813517f360dbf@mail.gmail.com>
References: <20040828132327.86165.qmail@web86907.mail.ukl.yahoo.com>
Reply-To: GoatZilla <goatzilla@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040828132327.86165.qmail@web86907.mail.ukl.yahoo.com>
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
To: cpufreq@www.linux.org.uk

http://www.tldp.org/HOWTO/Athlon-Powersaving-HOWTO/approaches.html

It's an example of how to use the setpci command, and also happens to
be instructions for turning on the bus disconnect feature for
squeezing that last bit of energy savings out.  It looks like one of
the disconnect bits is in the same register as this p-state transition
bit.  Stop to take a look at the command and learn how to use it
first, and use it to READ your register value before setting it.

My x86info tells me my FID won't change, but I can still change it
somehow.  I never had to do any PCI tweaking to get my FID changes to
work.  This may very well be motherboard dependant...  but I still
think you've done something else wrong.
