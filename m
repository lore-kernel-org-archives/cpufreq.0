From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Sun, 29 Aug 2004 15:26:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040829132612.GA17676@dominikbrodowski.de>
References: <41225D98.3090709@versanet.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41225D98.3090709@versanet.de>
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
To: Christian Heimanns <heimanns@versanet.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>

On Tue, Aug 17, 2004 at 09:33:44PM +0200, Christian Heimanns wrote:
> Hello Dominik
> 
> Here are some news:
> Today I've written a mail to Medion where I asked for a new BIOS. But I 
> have just a slight hope to get one. I will see and wait.
> 
> I changed two settings (self-explanatory) in the BIOS:
> QuickBoot Mode = Disabled
> Boot-time Diagnostic Screen = Enabled
> Now I can see the following boot message from the BIOS directly after 
> power on my notebook:
> 
> ***********************************************************************
> *                                                                     *
> * An incompatibility between the system and CPU FSB has been detected.*
> * You have installed a faster CPU into a system incapable of running  *
> * it as fast as the CPU is capable of.                                *
> *                                                                     *
> * This CPU is not running at it's peak performance                    *
> *                                                                     *
> ***********************************************************************
> 
> Maybe this is related to our problem?

This is very likely relate to our problem -- it basically tells us "the BIOS
isn't really aware of the CPU and doesn't know how to handle it". Amazing
the notebook got selled this way... So, any news from MEDION?

	Dominik
