From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Weird behaviour (cpufreq-2.4.21-2)
Date: Tue, 22 Jul 2003 14:13:55 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030722121355.GC1964@brodo.de>
References: <20030719003302.1664a98f.frx@firenze.linux.it> <20030719064528.GA1658@brodo.de> <20030722011220.2905e9e0.frx@firenze.linux.it>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030722011220.2905e9e0.frx@firenze.linux.it>
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
To: Francesco Poli <frx@firenze.linux.it>
Cc: CpuFreq <cpufreq@www.linux.org.uk>

On Tue, Jul 22, 2003 at 01:12:20AM +0200, Francesco Poli wrote:
> On Sat, 19 Jul 2003 08:45:28 +0200 Dominik Brodowski wrote:
> 
> > > The question is: what's wrong? What did I messed up with?
> > 
> > Hmmm... might it be that the BIOS meddles with the CPU frequency, too?
> > You could compare the output of the "bogomips" tool to detect
> > frequency changes, for example.
> 
> Here's a session log (I used bogomips v1.2 from the Debian Woody
> sysutils package)

Thanks

> It seems that the CPU clock frequency stays pretty fixed, doesn't it?

Indeed. But, as others pointed out, it might be a non-cpufreq related
problem but more a "battery loading" one. At least, I cannot see why there
should be any additional heat generation by cpufreq as the frequency doesn't
change at all...

	Dominik
