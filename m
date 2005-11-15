From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Transmeta Efficeon
Date: Tue, 15 Nov 2005 16:48:06 +0100
Message-ID: <20051115154806.GD15690@isilmar.linta.de>
References: <20051012080056.GC29101@mail.uft.uni-bremen.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051012080056.GC29101@mail.uft.uni-bremen.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Ranke <jranke@uni-bremen.de>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Wed, Oct 12, 2005 at 10:00:56AM +0200, Johannes Ranke wrote:
> 	- Is anybody developing/using cpufreq successfully with this CPU

AFAIK, it works. At least nobody complained about it for a long time :-)

> 	- Is there a good howto for cpufreq users?
Documentation/cpu-freq/user-guide.txt in the Linux kernel sources (e.g.
online accessible at:
http://kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;h=7fedc00c3d30b78688cf0693f1512234c7e00f9f;hb=4060994c3e337b40e0f6fa8ce2cc178e021baf3d;f=Documentation/cpu-freq/user-guide.txt
isn't really good, but it might be a suitable start.

> Maybe I should add that I am using an ECS A532 notebook. Is the chipset
> or anything else relevant?

Shouldn't be...

Hope that helps,
	Dominik
