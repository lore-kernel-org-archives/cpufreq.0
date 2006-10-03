From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: new p4-clockmod capable CPUs
Date: Tue, 3 Oct 2006 11:44:58 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454ABC718@scsmsx413.amr.corp.intel.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]=20
>Sent: Monday, October 02, 2006 6:28 PM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: new p4-clockmod capable CPUs
>
>Hi,
>
>On Mon, Oct 02, 2006 at 04:23:17PM -0700, Pallipadi, Venkatesh wrote:
>> >- Is the method in pentiumM_get_frequency() for these CPUs?
>> May not work and will need change. The bus speed will not be=20
>100 on all
>> these CPUs..
>
>What's the register to look at, and the values? Can't find anything in
>245472-012, unfortunately, which would help me for this...
>

MSR_FSB_FREQ - Latest SDM vol 3b (253669-020) has the information under
Core/Core2 MSRs (Ap B2).

Thanks,
Venki
