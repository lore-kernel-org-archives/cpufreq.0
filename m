From: Rob Hess <robwhess@gmail.com>
Subject: why does speedstep_detect_processor() return failure?
Date: Tue, 29 Nov 2005 19:16:53 -0800
Message-ID: <8dff05a00511291916h39427e1fsff55e81e3a843b21@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk

Hi,
In speedstep_lib.c, the function speedstep_detect_processor() returns 0 for
processor model 4 in family 0xf.  In fact, the function returns 0 for all
processors in family 0xf (Pentium 4 M) except model 2 (this is at line 213
in speedstep_lib.c in my kernel tree).  Can anyone help me understand why
that is?  Is there documentation to which someone can refer me?  I'm trying
to figure out why I am unable to use any of the speedstep drivers with my
P4M processor.

Thanks.
Rob Hess
