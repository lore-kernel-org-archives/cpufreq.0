From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Which cpu-freq module to use for Intel(R) Xeon(R) CPU
Date: Tue, 19 Jun 2007 09:32:17 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F50109173A@scsmsx415.amr.corp.intel.com>
References: <20070619150818.GA16404@tatooine.rebelbase.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20070619150818.GA16404@tatooine.rebelbase.local>
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
To: markus reichelt <ml@mareichelt.de>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>markus reichelt
>Sent: Tuesday, June 19, 2007 8:08 AM
>To: cpufreq@lists.linux.org.uk
>Subject: Re: Which cpu-freq module to use for Intel(R) Xeon(R) CPU
>
>* Dave Jones <davej@redhat.com> wrote:
>
>> In current kernels, speedstep-centrino is deprecated in favour of
>> acpi-cpufreq (and will disappear completely soon, possibly in .23)
>
>Any chance that the freq-tables (for Banias) of speedstep-centrino
>will survive? Where?
>

Table based speedstep will continue to use speedstep-centrino and
all ACPI based speedstep will migrate to acpi-cpufreq.

Thanks,
Venki
