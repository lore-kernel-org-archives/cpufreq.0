From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: oops on resume
Date: Thu, 5 Aug 2004 21:26:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040805192613.GA9008@dominikbrodowski.de>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
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
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: cpufreq@www.linux.org.uk

On Thu, Aug 05, 2004 at 03:02:04PM -0400, Brian J. Murrell wrote:
> Warning: CPU frequency out of sync: cpufreq and timingcore thinks of 1200000, i.divide error: 0000 [#1]
> Modules linked in: parport_pc(U) lp(U) parport(U) autofs4(U) ds(U) yenta_socket)CPU:    0

Oops. Can you do a 

cat /sys/devices/system/cpu/cpu0/cpufreq/*

on a running system, please?

Thanks,

	Dominik
