From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Mobile Celeron with Speedstep ? - speedstep-centrino freezes
	machine
Date: Mon, 20 Sep 2004 19:09:57 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040920170957.GC7952@dominikbrodowski.de>
References: <414EDDF1.90506@renninger.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <414EDDF1.90506@renninger.de>
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
To: Thomas Renninger <mail@renninger.de>
Cc: cpufreq@www.linux.org.uk

On Mon, Sep 20, 2004 at 03:41:05PM +0200, Thomas Renninger wrote:
> I thought Celeron CPUs are not speedstep capable, seems as if I was 
> wrong (ss flag indicates speedstep, right?)...

no, ss flag indicates something else, enhanced speedstep is indicated by
"est".

> On this machine speedstep-centrino freezes machine (shouldn't it already 
> go out at the model name check, or has this been changed?):

It should reaturn -ENODEV in centrino_init().

        if (!cpu_has(cpu, X86_FEATURE_EST))
                return -ENODEV;


	Dominik
