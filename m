From: David  <davidendless@email.it>
Subject: Re: Weird behaviour (cpufreq-2.4.21-2)
Date: Sat, 19 Jul 2003 18:18:53 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307191818.53516.davidendless@email.it>
References: <20030719003302.1664a98f.frx@firenze.linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030719003302.1664a98f.frx@firenze.linux.it>
Content-Disposition: inline
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
To: CpuFreq <cpufreq@www.linux.org.uk>


> When I go back on AC power, the battery starts charging (as reported by
> the LED and by ACPI). And the temperature goes up towards 80 degrees
> Celsius; the back fan wakes up thus pushing the temperature down again
> to 69 degrees Celsius; then the fan rests and the temperature goes up
> again. This thermal cycle goes on and on, even if the CPU is almost
> totally idle.

I think it isn't a cpufreq problem. I got the same behaviour without loading 
cpufreq module. Probably it is an ACPI issue.
It happens to me even in another case: if the computer boots in AC power but 
the battery charge is not full, when the battery lever reaches the top, the 
temperature goes up and the fan starts.

I have an Acer Aspire 1304 XC (Athlon XP 1800+)

David
