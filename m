From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: Temperature Limiting Govenor?
Date: Tue, 31 Jan 2006 08:59:58 -0600
Message-ID: <B3870AD84389624BAF87A3C7B83149930293550D@SAUSEXMB2.amd.com>
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
To: David Pottage <david@chrestomanci.org>, cpufreq@www.linux.org.uk

On Tuesday, January 31, 2006 3:45 AM cpufreq-bounces@lists.linux.org.uk =
wrote:
> Hi.
>=20
> I have an AMD64 system, that will tend to heat up hotter than I would
> prefer if it is run at the maximum clock speed, especialy in summer.
>=20
> In order to prolong the life of the CPU, and other components in my
> case, I have written a simple user space governor in perl, that
> dynamically limits the maximum clock speed to prevent CPU overheat,
> while allowing short busts at full speed.
>=20
> On my system this allows me busts of high CPU speed for good =
interactive
> performance, while preventing long running processes such as media
> encoding from causing exesively high temperatures.
>=20
> Would it be worthwhile incorporating similar functionality
> into a kernel space governor? How easy would it be to do?=20
> Is it possible for more than one governor to be active at once?

Writing the governor policy control should be a fairly easy task, =
depending on how complex of control mechanism is put in to place.  =
However, the difficult part is to find a generic way to grab the system =
temperature data.  ACPI thermal zones would be nice, however some BIOSes =
do not support it.  The lm_sensors (integrated into 2.6 kernel now) =
project only supports handful of hardware (both southbridge and =
temperature sensor chip must be supported).

-Jacob Shin
AMD, Inc.
