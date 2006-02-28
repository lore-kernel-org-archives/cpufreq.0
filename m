From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [PATCH] [1/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 11:36:09 -0600
Message-ID: <B3870AD84389624BAF87A3C7B831499302935665@SAUSEXMB2.amd.com>
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
To: "shin, jacob" <jacob.shin@amd.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, "Langsdorf, Mark" <mark.langsdorf@amd.com>, Andi Kleen <ak@suse.de>

On Tuesday, February 28, 2006 10:54 AM shin, jacob wrote:

> The test results should still be valid.  But will test again
> regardless.

Did more testing w/ the updated patch.  Everything still looks
good as it should.. w/ or w/o hotplug, smp.. etc.

again, the changes should be transparent the the rest of the
world.

Thanks!

-jacob
