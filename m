From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: TM5800 and longrun
Date: Wed, 21 Apr 2004 17:16:02 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040421151602.GE7389@dominikbrodowski.de>
References: <20040420203953.GA9411@dominikbrodowski.de>
	<PLEKLEBDHEEMEIKIDEGNOEEICAAA.dflogera@halifax.mda.ca>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <PLEKLEBDHEEMEIKIDEGNOEEICAAA.dflogera@halifax.mda.ca>
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
To: David Flogeras <dflogera@iotek.ns.ca>
Cc: cpufreq@www.linux.org.uk

On Wed, Apr 21, 2004 at 10:27:45AM -0300, David Flogeras wrote:
> OK that works!
> 
> Why can I not set the minimum any lower than 73% ?  Is this a hardware
> limit, or is something not working right.

It's a limit imposed by the hardware and/or the firmware and/or the Code
Morphing Software -- the CPU can only be set by the kernel to 73% of the 
maximum CPU frequency.

	Dominik
