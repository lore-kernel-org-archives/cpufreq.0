From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: Celeron 220
Date: Thu, 24 Apr 2008 13:11:03 -0400
Message-ID: <4810BF27.6040001@redhat.com>
References: <480FA81A.1060308@dtech.sk>
	<1209030828.1784.673.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1209030828.1784.673.camel@queen.suse.de>
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
To: cpufreq@lists.linux.org.uk

Thomas Renninger wrote:
> On Wed, 2008-04-23 at 23:20 +0200, Ing. Michal Zahor wrote:
>> Hi,
>>
>> Celeron 220 in MoBo D201GLY2  said:
>> p4-clockmod: Unknown p4-clockmod-capable CPU. Please send an e-mail to 
>> <cpufreq@lists.linux.org.uk>
>>
>> Is it possible to use any clockmod ?
> 
> Can the p4-clockmod driver be finally removed?

+1

> AFAIK it's doing exactly the same as throttling.
> I can remember it interfered with throttling
> through /proc/acpi/processor/*/throttling and made the machine very slow
> if both got used.
> 
> The throttling interface got enhanced recently and is the one to go for.
> 
> There were hundreds of confusing p4-clockmod reports now on the cpufreq
> list... and since a distribution (guessing) is trying to load it by
> default the amount of these reports seem to increase recently.

DaveJ shut it off in the Fedora kernels a while ago now, and only a few people 
have even noticed, and most understood that it was for the best...


-- 
Jarod Wilson
jwilson@redhat.com
