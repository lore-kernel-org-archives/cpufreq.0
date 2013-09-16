From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
Subject: cpufreq and QEMU guests
Date: Mon, 16 Sep 2013 14:15:46 +0200
Message-ID: <20130916121545.GH5105@irqsave.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, gleb@redhat.com, viresh.kumar@linaro.org, agraf@suse.de, rjw@sisk.pl, pbonzini@redhat.com


Hello,

I know a cloud provider worried about the fact that the /proc/cpuinfo of =
his
guests give a bogus frequency to his customer.

QEMU and the guests kernel currently have no way to reflect the host freq=
uency
changes to the guests.

The customer compute intensive application then read this information and=
 take
wrong decisions.

I looked at the various Linux cpufreq drivers and they all seems to be ta=
ble
based. Is it true ?

For example the acpi cpufreq driver have 16 differents pstates at hand to=
 lookup
in the pstate table and get the frequency.

Given that guests can migrate from one hardware to a slightly different h=
ardware
the table may become wrong after live migration.

What would be the best hardware to emulate in order to pass an arbitrary
frequency to the guest ?

Would a pvfreq paravirtualized QEMU hardware and a guest driver implement=
ing
only the callbacks needed to read the frequency be a good idea ?

Best regards

Beno=EEt

ps:
I CC this mail to the other QEMU arch maintainers because the problem mus=
t be
the same everywhere where KVM run.

