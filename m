From: Norbert Preining <preining@logic.at>
Subject: Re: CHOWN PB
Date: Fri, 19 Sep 2003 09:06:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030919070643.GA32609@gamma.logic.tuwien.ac.at>
References: <3F6A35D7.8070605@wanadoo.fr> <03091908435100.00212@gate>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <03091908435100.00212@gate>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

On Fre, 19 Sep 2003, Michael Filz wrote:
> This is one of the few cases where suid root is really useful. Put everyt=
hing=20
> you want in a script, suid it and put it in the bin directory of your cho=
ice.=20

There is no "setuid script" because the interpreter is not setuid.
That's the reason why there is a setuid-perl.

You have to write a binary wrapper, or use perl with setuid-perl.

Best wishes

Norbert

---------------------------------------------------------------------------=
----
Norbert Preining <preining AT logic DOT at>         Technische Universit=E4=
t Wien
gpg DSA: 0x09C5B094      fp: 14DF 2E6C 0307 BE6D AD76  A9C0 D2BF 4AA3 09C5 =
B094
---------------------------------------------------------------------------=
----
HAGNABY (n.)
Someone who looked a lot more attractive in the disco than they do in
your bed the next morning.
			--- Douglas Adams, The Meaning of Liff
