From: AthlonRob <AthlonRob@axpr.net>
Subject: Re: [RFC] split up cpufreq.c in several files, x86 autoloader
Date: Fri, 03 Oct 2003 16:23:52 -0700
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1065223432.13298.16.camel@dell.linux.box>
References: <20031003223612.GA18181@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20031003223612.GA18181@brodo.de>
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
To: cpufreq@www.linux.org.uk

On Fri, 2003-10-03 at 15:36, Dominik Brodowski wrote:

> For x86 there is a wide choice of cpufreq drivers. Especially for
> distributions and inexperienced users [no pun intended] it might become more
> and more difficult to select the best driver: "I got a mobile Pentium-4-M,
> p4-clockmod or speedstep-ich?" is one good example. Should the detection of
> the "best" cpufreq driver be made available as an optional(!)
> "cpufreq-autoload" module in arch/i386/kernel/cpu/cpufreq/?

I like that idea, as well as the module idea.

I would be sure and take in to account, however, Dell laptops not
wanting to work with some (all?) drivers in this autoload section.

Rob
