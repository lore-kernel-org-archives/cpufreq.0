From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq for older Toshibas with P3-M and ALi chipset?
Date: Mon, 3 Jan 2005 10:36:27 +0100
Message-ID: <20050103093626.GA8060@dominikbrodowski.de>
References: <41D8204F.3090108@bakke.com>
	<20050102174242.GB15802@dominikbrodowski.de>
	<41D88523.4040809@bakke.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41D88523.4040809@bakke.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dag Bakke <dag@bakke.com>
Cc: ptb@it.uc3m.es, cpufreq@www.linux.org.uk

On Mon, Jan 03, 2005 at 12:34:59AM +0100, Dag Bakke wrote:
> Well, I believe it is just the same function as cpuswitch exploits, 
> because cpuswitch reports the cpu to be running at 'level 4' when I make 
> it boot at 500Mhz.

Then the "half speed" method doesn't work using the FSB but by throttling
the CPU.

	Dominik
