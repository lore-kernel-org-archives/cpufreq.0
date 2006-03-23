From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] keep ignore_nice_load value when the ondemand govenor
	is reselected
Date: Thu, 23 Mar 2006 05:41:09 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6007A24DB1@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Eric Piel <Eric.Piel@tremplin-utc.net>, Dave Jones <davej@redhat.com>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>


Ack. Dave, please add this patch onto your git tree.

Thakns,
Venki
=20

>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Friday, March 10, 2006 1:35 AM
>To: Pallipadi, Venkatesh; Dave Jones
>Cc: CPUFreq Mailing List
>Subject: [PATCH] keep ignore_nice_load value when the ondemand=20
>govenor is reselected
>
>Hello,
>
>With the ondemand governor, ignore_nice_load is reset each time the=20
>governor is selected. That's annoying because each time I change to=20
>another governor and change back to ondemand, I also have to set up=20
>ignore_nice_load. eg:
># cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/ignore_nice_load
>1
># cpufreq-set -g powersave
># cpufreq-set -g ondemand
># cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/ignore_nice_load
>0
>
>This behavior is also inconsistent with the other variables of=20
>/sys/devices/system/cpu/cpu0/cpufreq/ondemand/
>
>Attached is a patch that corrects the behavior.
>
>see you,
>Eric
>
>---
>From: Eric Piel <eric.piel@tremplin-utc.net>
>
>Keep the value of ignore_nice_load of the ondemand governor even after=20
>the governor has been deselected and selected back. This is=20
>the behavior=20
>of the other exported values of the ondemand governor and it's=20
>much more=20
>user-friendly.
>
>Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
>
>
