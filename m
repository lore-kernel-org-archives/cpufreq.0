From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Problem with ondemand on Athlon
Date: Mon, 10 Nov 2003 21:59:12 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031110205912.GB7149@brodo.de>
References: <200310310434.01311.thierry.lathuille2@libertysurf.fr>
	<20031104181227.GA4326@brodo.de>
	<20031105182110.GA922@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031105182110.GA922@inferi.kami.home>
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
To: cpufreq@www.linux.org.uk

This is really strange... will provide a DEBUG()-printk patch soon, would be
great if you could test it then...

On Wed, Nov 05, 2003 at 07:21:10PM +0100, Mattia Dongili wrote:
> On Tue, Nov 04, 2003 at 07:12:27PM +0100, Dominik Brodowski wrote:
> > Unfortunately, I can't reproduce the problem locally on my p4.
> > Can both of you try out the following, please:
> > 
> > pass "clock=pit" as a command line argument
> 
> this semms not to be a valid argument here

? clock=pit specifies that the PIT should be used instead of the TSC as
timing source... so it should be a valid boot argument.

> Linux inferi-2 2.6.0-test9-1 #3 Thu Oct 30 19:40:17 CET 2003 i686 GNU/Linux
> > 
> > The p4-clockmod driver [currently] needs to be built as a module then, 
> > and you need to pass stock_freq as an argument then. AFAIK, no such
> > requirement exists for powernow-k7.
> 
> having a P4 1.8GHz do I need stock_freq=1800000 ? (tried, it works)

yes.

> # modprobe p4_clockmod stock_freq=1800000
> 
> # echo *ondemand* > /sys/.../scaling_governor 
> --> never returns

strange...

	Dominik
