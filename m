From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: Adding SMP capability to ACPI cpufreq driver and related bugfixes
Date: Tue, 22 Jun 2004 17:40:46 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60022D150C@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
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
Cc: linux-acpi <linux-acpi@intel.com>


http://bugme.osdl.org/show_bug.cgi?id=3D2615
And
http://bugme.osdl.org/show_bug.cgi?id=3D2712

has few patches along with detailed descriptions. The objective of these
patches:
To add Enhanced Speedstep Technology (EST) support through ACPI cpufreq
driver, on an SMP system that has EST.

Comments/feedbacks welcome.

Thanks,
Venki
