From: Cedric De Wilde <daique@skynet.be>
Subject: Re: freeze when loadinf powernow-k7
Date: Sat, 26 Jul 2003 01:01:23 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030725230123.GA10347@jolinar>
References: <20030725101826.GA1667@jolinar>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030725101826.GA1667@jolinar>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cpufreq@www.linux.org.uk

I've discovered something strange, when I kill X and umount my
/home(because it's a great partition in ext2), the module load
correctly. I've tested at least 10 times without killing X and it freeze
every time. when I kill it, it load perfectly.

Cedric

On Fri, Jul 25, 2003 at 12:18:26PM +0200, Cedric De Wilde wrote:
> Hello,
> 
> When I try to do a "modprode powernow-k7", my system totally freeze.
> It's a xp-m 2500+(targa xp10), I use the cooker kernel(2.4.21-6mdk)
> which seem to contain the patch from codemonkey(but I can't
> verificate since it's down). Is there a newer patch than
> http://cvs.mandrakesoft.com/cgi-bin/cvsweb.cgi/SPECS/kernel/CT01-2_cpufreq-2.4.22-1.patch?rev=1.1&content-type=text/x-cvsweb-markup
> ?
> 
> Cedric
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
