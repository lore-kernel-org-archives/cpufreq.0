From: "Gross, Mark" <mark.gross@intel.com>
Subject: [RFC] sysdev_driver / cpufreq notification locking design issue.
Date: Tue, 13 Jun 2006 09:57:53 -0700
Message-ID: <5389061B65D50446B1783B97DFDB392D015E5A3A@orsmsx411.amr.corp.intel.com>
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
To: cpufreq@lists.linux.org.uk

Recall the thread :
http://lists.linux.org.uk/mailman/private/cpufreq/2006-May/005858.html

The problem is that the sysdev calls the .suspend / .resume entry points
with interrupts off, while the cpufreq_suspend calls into its
notification call backs implicitly assuming interrupts are enabled.

I was asked to take a quick look at this.

It seems that the attributes exposed by the system device could be move
somewhere else in the sysfs hierarchy easily enough.  I'm thinking under
/sys/devices/platform/cpufreq should be an ok place to put the
cpufreq-attributes.  However, what to do about the suspend / resume
notifications from sysdev? =20

I know the design is currently broken WRT locking, but if we remove the
suspend/resume notification linkage to sysdev, then what other items
will be broken? =20

What about CPU Hotplug's dependency on add / remove sysdev_driver
exports?  I think we need those.

What badness happen if we remove the sysdev linkage within cpufreq?

Any advice is welcome, as I'm just starting to look at this now.

Thanks,

--mgross
Intel Open Source Technology Center
(503) 677-4628
(503)-712-6227
ms: JF1-235
2111 NW 25th Ave
Hillsboro, OR 97124
=20
