From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [PATCH] powernow-k8 typos
Date: Mon, 11 Jun 2007 10:11:38 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02076E5F@SAUSEXMB1.amd.com>
References: <200706081133.08650.joachim.deguara@amd.com>
	<20070611150517.GF9174@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20070611150517.GF9174@redhat.com>
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
To: Dave Jones <davej@redhat.com>, "Deguara, Joachim" <joachim.deguara@amd.com>
Cc: cpufreq@lists.linux.org.uk


 >  >  				(data->powernow_table[j].index=20
> & 0xff0000) >> 16,
>  >  				data->powernow_table[j].frequency/1000);
>  >  			} else {
>  > @@ -1084,7 +1084,7 @@ static int powernowk8_target(struct cpuf
>  > =20
>  >  	if (cpu_family =3D=3D CPU_HW_PSTATE)
>  >  		dprintk("targ: curr fid 0x%x, did 0x%x\n",
>  > -			data->currfid, data->currvid);
>  > +			data->currfid, data->currdid);
>=20
> I've been curious for a while.. What is a 'did' ?
> fid and vid I can figure out, but did has been puzzling me.

Divisor ID.  It's part of a new scheme to allow us to
define a much larger range of allowable voltages and
frequencies.

-Mark Langsdorf
Operating System Research Center
AMD
