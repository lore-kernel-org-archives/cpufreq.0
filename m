From: "Duval, Dominic" <DDuval@oerlikon.ca>
Subject: RE: Setting speed on Xscale
Date: Tue, 1 Jul 2003 16:16:41 -0400
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <AE20493C16DE7F46BC29B257C8D708D3237B80@mail.oerlikon.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
content-class: urn:content-classes:message
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Vegar Lauritzsen <laurits@stud.ntnu.no>, cpufreq@www.linux.org.uk

Hi,

You should look at the latest -pxa patches available on the 2.4.19 =
kernel.

Everything you need to set the cpu speed is now available, and a =
convenient
/proc interface can be used to set it without rebooting the system.

Hope this helps,

-Dominic Duval


-----Original Message-----
From:	Vegar Lauritzsen [mailto:laurits@stud.ntnu.no]
Sent:	Tue 7/1/2003 3:20 PM
To:	cpufreq@www.linux.org.uk
Cc:=09
Subject:	Setting speed on Xscale

Hi, does anyone have experiece on setting the cpu speed on the PXA-250.
I'm trying to set my PXA-250 to the different speedlevels used in
power-saving. I would like to be able to do some teste on my system =
while
decreasing the max speed setting.
As for now the only solution I see is to modify the table in cpu-pxa.c
(from I-linux-2.4.18) and make four different compilations of the
kernel for each max-speed setting.
Is there a nother way?

The novice

-Vegar


ps! Thanks Chain Yuan for pointing me to the right file

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq
