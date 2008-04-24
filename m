From: Thomas Renninger <trenn@suse.de>
Subject: Re: Celeron 220
Date: Thu, 24 Apr 2008 11:53:48 +0200
Message-ID: <1209030828.1784.673.camel@queen.suse.de>
References: <480FA81A.1060308@dtech.sk>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <480FA81A.1060308@dtech.sk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: "Ing. Michal Zahor" <mzahor@dtech.sk>
Cc: cpufreq@lists.linux.org.uk

On Wed, 2008-04-23 at 23:20 +0200, Ing. Michal Zahor wrote:
> Hi,
> 
> Celeron 220 in MoBo D201GLY2  said:
> p4-clockmod: Unknown p4-clockmod-capable CPU. Please send an e-mail to 
> <cpufreq@lists.linux.org.uk>
> 
> Is it possible to use any clockmod ?

Can the p4-clockmod driver be finally removed?

AFAIK it's doing exactly the same as throttling.
I can remember it interfered with throttling
through /proc/acpi/processor/*/throttling and made the machine very slow
if both got used.

The throttling interface got enhanced recently and is the one to go for.

There were hundreds of confusing p4-clockmod reports now on the cpufreq
list... and since a distribution (guessing) is trying to load it by
default the amount of these reports seem to increase recently.

   Thomas
