From: Russell King <rmk@arm.linux.org.uk>
Subject: [BUG] cpufreq on SMP with CPUs present but not online
Date: Mon, 17 Jan 2005 22:38:27 +0000
Message-ID: <20050117223827.D31178@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@zenII.linux.org.uk

... causes the cpufreq driver init method to be called for each CPU.
However, this causes something of a dilema on ARM/SMP - if the CPU
is not online (because we failed to bring it up via __cpu_up which
correctly returned an error), we can't read the current clock rate
settings, so we can't initialise policy->{cur,min,max} fields.

Returning an error from the cpufreq driver init method means that
cpufreq completely forgets about this particular CPU, which also
isn't desirable.

Ideas?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
