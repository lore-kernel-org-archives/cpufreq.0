From: Luigi Belli <lbelli@crema.unimi.it>
Subject: Silly bug (typo?) in cpufreq from 2.4.21-ac4
Date: Wed, 2 Jul 2003 19:42:36 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307021942.36520.lbelli@crema.unimi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@www.linux.org.uk

Ok, I discovered with the help of x86info why after my patch in certain=20
situation I still had higher temperature than in Windows...

=46rom powernow-k7.c, line 298:

} else {
	/* Going up, so change VID first */
	change_VID(fid);
	change_FID(vid);
}


Bye, gigi
