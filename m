From: Doug Sutherland <wearable@cogeco.ca>
Subject: Re: VIA C3 M10k Nehemiah longhaul support in 2.6.x ?
Date: Fri, 27 Feb 2004 20:49:46 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <5.1.0.14.2.20040227203914.00a86e20@pop.cogeco.ca>
References: <EFEF4C473088B847B64CD953D2A6A104FE8228@sdso14a.par.siemens .fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; x-avg-checked=avg-ok-7D8D654D;
	boundary="=======5D401779======="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <EFEF4C473088B847B64CD953D2A6A104FE8228@sdso14a.par.siemens .fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: BARRE Francois <francois.barre@siemens.com>
Cc: cpufreq@www.linux.org.uk

--=======5D401779=======
Content-Type: text/plain; x-avg-checked=avg-ok-7D8D654D; charset=iso-8859-1;
	format=flowed
Content-Transfer-Encoding: quoted-printable

Fran=E7ois wrote:

 > [Nehemiah longhaul] Not seems to be supported still in actual
 > 2.6.3-bk9 version, although it was working on 2.4.x

Are you sure Nehemiah was supported for 2.4 kernels?
I just patched a 2.4.25 kernel with cpufreq.
I have a Nehemiah model 9 stepping 4 processor.

longhaul: Nehemiah unsupported: Waiting on working silicon from VIA before=
=20
this is usable.

You had a Nehemiah working with 2.4?

I see all the Nehemiah clock scaling data in the source code
but when it reaches case: 9 (model 9 - nehemiah) there is a
the above kernel message.

I couldn't get my nehemiah working with cpufreq :(

But this alternate (non kernel) driver allowed me to
scale back the clock ...

http://www3.sympatico.ca/howlettfamily/epia/longhaul-1.2.tar.gz
See this in the viaarena forums
http://forums.viaarena.com/messageview.cfm?catid=3D4&threadid=3D52209

Please let me know if you get cpufreq working with your nehemiah.
I'd much rather use the kernel source.

   -- Doug

--=======5D401779=======
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=======5D401779=======--


