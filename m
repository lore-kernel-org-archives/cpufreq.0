From: "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPIP-state
	driver
Date: Tue, 21 Oct 2003 08:47:51 -0700
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <7F740D512C7C1046AB53446D3720017304B031@scsmsx402.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
content-class: urn:content-classes:message
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
To: arjanv@redhat.com, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, Dominik Brodowski <linux@brodo.de>, linux-acpi <linux-acpi@intel.com>, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

>=20
> it's all nice code and such, but I still wonder why this can't be done
> by a userland policy daemon. The 2.6 kernel has the infrastructure to
> give very detailed information to userspace (eg top etc) about idle
> percentages...... I didn't see anything in this driver that couldn't
be
> done from userspace.
>=20

It's about the frequency of the feedback loop. As we have much lower
latency with P-state transitions, the sampling time can be order of
millisecond (or shorter if meaningful). A userland daemon can have a
high-level policy (preferences, or set of parameters), but it cannot be
part of the real feedback loop. If we combine P-state transitions and
deeper C-state transitions, the situation is worse with a userland
daemon.

	Jun
