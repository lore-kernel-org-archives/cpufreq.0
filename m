From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Q6600 CPU Frequency Scaling Problem / Bug
Date: Mon, 30 Jun 2008 13:21:09 -0700
Message-ID: <7E82351C108FA840AB1866AC776AEC46066E6834@orsmsx505.amr.corp.intel.com>
References: <4869391A.9010006@bayindir.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <4869391A.9010006@bayindir.org>
Content-Language: en-US
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
To: Hakan BAYINDIR <hakan@bayindir.org>, "cpufreq@lists.linux.org.uk" <cpufreq@lists.linux.org.uk>


>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Hakan BAYINDIR
>Sent: Monday, June 30, 2008 12:51 PM
>To: cpufreq@lists.linux.org.uk
>Subject: Q6600 CPU Frequency Scaling Problem / Bug
>
>Hi,
>
>I'm running Debian testing on an Intel Core2Quad Q6600 with
>4GB DDR2 RAM
>on a MSI P35 Platinum board since December 07. When I first migrated my
>system on December (I've installed Debian as etch beta1 and upgrading
>since), every core of the CPU was scaling their frequency
>independently.
>After installing 2.6.22, The cores started to scale in a synchronized
>way. I.e. when a core needs to speed-up, every core speeds up in sync.
>The weird thing is, I have another clone of this OS at my
>office running
>on a core 2 duo processor and that system scaled its processors
>independently.
>
>The ganged scaling behavior is also consistent with the
>/sys/devices/system/cpuX/cpufreq/affected_cpus file and cpufreq-info
>command. Both of them shows that all CPU's speeds are need to
>be in sync
>while there's really no need. Also Ubuntu 8.04 Live CD
>exhibits the same
>behavior and this behavior can be verified under sysfs again.
>
>Is it a bug? Is it expected? I can provide more information if it's
>needed. I'm attaching cpufreq-info's output as a reference.
>

Just to confirm what I understood:
- Older kernels, each logical CPU can show different frequencies and affected_cpus has only once CPU number in it.
- Newer kernel, logical CPUs show same freq and affected_cpus includes all CPUs in the platform.

Correct?
In this case it seems to be the expected behavior.

In actual hardware, voltage is coordinated at socket level and that is the reason frequencies in one socket are tied together. Now, what has changed in two above config will be the mode in which kernel operates:
1) Hardware coordination mode: Kernel thinks each core is having independent frequency and reports the same. Underneath, hardware does frequency coodination and picks the highest requested frequency among all cores and runs all cores at that freq.
2) Software coordination mode: Kernel understands which specific CPUs are dependent and picks the highest frequency needed among all such dependent cores and makes single request for such frequency and reports the same.

Note that there should not be any power consumption difference with these two kernels on under identical load. Just that the kernel now knows more about the frequency dependencies in the platform.

Thanks,
Venki
