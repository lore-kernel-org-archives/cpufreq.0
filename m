From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: [PATCHSET] 0/3 A dynamic cpufreq governor
Date: Sat, 25 Oct 2003 12:53:30 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6007796A@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk, Linus Torvalds <torvalds@osdl.org>, akpm@osdl.org
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Pavel Machek <pavel@ucw.cz>, Dominik Brodowski <linux@brodo.de>


Hi,

This is the "new and improved" version of the patch =20
that was sent out earlier this week. Thanks for all the=20
feedback/suggestions.
(lkml subject line reference for previous thread -
"Dynamic cpufreq governor and updates to ACPI P-state driver")

The changes from the previous version:
1) dynamic cpufreq governor changes completely separated=20
  from the updates to acpi P-state driver. These patches only=20
  deal with dynamic cpufreq governor. Separate patch will be=20
  sent out later to cover acpi updates.
2) New name for this cpufreq driver "cpufreq_ondemand"
  (Thanks to Pavel for the name)
3) Miscellaneous bugfixes and changes based on the review comments
4) And introduction of tuning knobs, where advanced user can tune
  the cpufreq_ondemand behaviour.=20
  (Thanks to Dominik for helping me with this)
  Sampling_rate, down_threshold, up_threshold are currently exported.
  More advanced user who wants to change the algorithm itself, can=20
  take the base infrastructure from this driver and come up with a=20
  new/optimized frequency switching algorithm, as this driver is GPLed
:).

Patch contents (patches against 2.6.0-test8):
ondemand1.patch - 'unit' related bugfixes in drivers.=20

ondemand2.patch - basic cpufreq_ondemand governor, with some changes=20
since the last time.

ondemand3.patch - Adding sysfs interface for cpufreq_ondemand=20
tunables and making sysfs access by cpufreq governors safe against=20
removal of the underlying module (from Dominik).=20


Thanks,
-Venkatesh
