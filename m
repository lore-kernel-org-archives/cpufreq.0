From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Weird behaviour (cpufreq-2.4.21-2)
Date: Sat, 19 Jul 2003 08:45:28 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030719064528.GA1658@brodo.de>
References: <20030719003302.1664a98f.frx@firenze.linux.it>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030719003302.1664a98f.frx@firenze.linux.it>
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
To: CpuFreq <cpufreq@www.linux.org.uk>, frx@firenze.linux.it

On Sat, Jul 19, 2003 at 12:33:02AM +0200, Francesco Poli wrote:
> Then I disconnect the laptop from the electrical network: so I run on
> battery.
> When I go back on AC power, the battery starts charging (as reported by
> the LED and by ACPI). And the temperature goes up towards 80 degrees
> Celsius; the back fan wakes up thus pushing the temperature down again
> to 69 degrees Celsius; then the fan rests and the temperature goes up
> again. This thermal cycle goes on and on, even if the CPU is almost
> totally idle.
> 
> A simple reboot stops this behaviour and, after a while, I get
> $ cat /proc/acpi/thermal_zone/THRM/temperature
> temperature:              57 C
> 
> The question is: what's wrong? What did I messed up with?

Hmmm... might it be that the BIOS meddles with the CPU frequency, too?
You could compare the output of the "bogomips" tool to detect frequency 
changes, for example.

	Dominik
