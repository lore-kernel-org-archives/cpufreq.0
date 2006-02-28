From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [PATCH] [1/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 10:54:26 -0600
Message-ID: <B3870AD84389624BAF87A3C7B83149930293565F@SAUSEXMB2.amd.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, "Langsdorf, Mark" <mark.langsdorf@amd.com>, Andi Kleen <ak@suse.de>

On Tuesday, February 28, 2006 10:51 AM shin, jacob wrote:
> On Tuesday, February 28, 2006 10:23 AM Dave Jones wrote:
>> On Mon, Feb 27, 2006 at 07:54:36PM -0600, shin, jacob wrote:
>>  > +	data->currvid =3D data->currvid;
>>  > +	data->currfid =3D data->currfid;
>=20
> Sorry about that, here we go again..

The test results should still be valid.  But will test again
regardless.

-jacob
